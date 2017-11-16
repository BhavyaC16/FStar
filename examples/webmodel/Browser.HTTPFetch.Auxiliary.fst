(*
  fetch.spec.whatwg.org and referrer-policy spec (https://www.w3.org/TR/referrer-policy/)
  Some auxiliary functions used in the different fetch procedures
*)
module Browser.HTTPFetch.Auxiliary

open AuxiliaryFunctions
open Web.Origin
open Browser.AuxiliaryDatatypes
open Browser.Datatypes

module List = FStar.List.Tot

(* Get's response from the network on a connection - modify using getResponse, getResponseConn functions *)
(* assume val getResponseForRequest : browser -> browserRequest -> Tot (option actResponse * browser) *)

(* prompt user to get username and password *)
val getUserPassword : browser -> Tot (string * string)
let getUserPassword b = ("user", "pwd")

(* 4.1 Main Fetch - Should browserRequest be blocked due to bad port *)
val block_port : browserRequest -> Tot bool
let block_port r =
  let rscheme = getScheme (firstElement (BRequest?.rf r).requrl) in 
  let rport = getPort (firstElement (BRequest?.rf r).requrl) in
  if rscheme = "ftp" && (rport = Some 20 || rport = Some 21) then false
  else if (rscheme = "http" || rscheme = "https") && (Some? rport) && port_is_bad (Some?.v rport) then true
  else false (*request should be allowed*)

(* 8.3 - Referrer Policy - Determine browserRequest's referrer *)
val get_referrer : r:browserRequest{(BRequest?.rf r).reqref <> NoReferrer} -> rp:refPolicy{rp <> RP_EmptyPolicy} -> Tot referer
let get_referrer r rp =
  let refSource = (match (BRequest?.rf r).reqref with | Client w -> (getWinURI w) | URLReferrer u -> u) in
  let refOrigin = URLReferrer (getOriginURL (refSource)) in
  let refURL = URLReferrer (getRefURL (refSource)) in
  match rp with
  | RP_NoReferrer -> NoReferrer
  | RP_NoRefWhenDowngrade -> refURL
  | RP_SameOrigin -> (match (isSameAOrigin (BRequest?.rf r).reqo (getAOrigin refSource)) with
		    | false -> NoReferrer
		    | true -> refURL)
  | RP_Origin     -> refOrigin
  | RP_StrictOrigin -> refOrigin (* Check for TLS-protected windows*)
  | RP_OriginWhenCO -> (match (isSameAOrigin (BRequest?.rf r).reqo (getAOrigin refSource)) with
		      | false -> refOrigin 
		      | true -> refURL)
  | RP_StrictWhenCO -> (match (isSameAOrigin (BRequest?.rf r).reqo (getAOrigin refSource)) with
		      | false -> refOrigin
		      | true -> refURL)
  | RP_UnsafeURL -> refURL

(* Referrer Policy --- 8.2. Set request’s referrer policy on redirect *)
val setRefPolRedirect : req:browserRequest -> resp:actResponse{requestResponseValid req resp} -> Tot (nreq:browserRequest{requestResponseValid nreq resp})
let setRefPolRedirect req resp =
  let refPol = parseRefPol resp in
  if refPol = RP_EmptyPolicy then req 
  else BRequest (BRequest?.rsl req) ({(BRequest?.rf req) with reqrefPolicy=refPol})

val refPolRedForbiddenHeaderLemma : req:browserRequest{notForbiddenHeaderfieldInReqHeader (BRequest?.rf req).reqhead} -> resp:actResponse{requestResponseValid req resp} -> 
				    Lemma (requires (notForbiddenHeaderfieldInReqHeader (BRequest?.rf req).reqhead)) 
				    (ensures (notForbiddenHeaderfieldInReqHeader (BRequest?.rf (setRefPolRedirect req resp)).reqhead)) 
let refPolRedForbiddenHeaderLemma req resp = ()

(* Is request's method cors-safelisted method *)
val isCORSSafelistedMethod : reqMethod -> Tot bool
let isCORSSafelistedMethod m = (m="GET" || m="HEAD" || m="POST")

(* Are the request and response from same origin *)
val isSameOriginRR : a_origin -> a_origin -> Tot bool
let isSameOriginRR reqo respo = (isSameAOrigin reqo respo) 

(* retrieve internal response from the filtered response *)
val getInternalResponse : filteredResponse -> Tot actResponse
let getInternalResponse f = match f with
  | BasicFiltered bf -> bf.ir
  | CORSFiltered cf -> cf.ir 
  | OpaqFiltered opf -> opf.ir
  | OpaqRedFiltered orf -> orf.ir

(* Response is not a network error *)
val notNetError : response -> Tot bool
let notNetError resp = match resp with | NetworkError _ -> false | RespSuccess _ -> false | _ -> true (* disallowing respsuccess as well *)

val hasAuthzHeader : header -> Tot bool
let rec hasAuthzHeader h =
  match h with
  | [] -> false
  | (hf,hv)::tl -> (hf="Authorization") || (hasAuthzHeader tl)
