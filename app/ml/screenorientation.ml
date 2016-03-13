(* --------------------------------------------------------------------------- *)
class type screen_orientation =
  object
    method lockOrientation      : Js.js_string Js.t -> unit Js.meth
    method orientation          : Js.js_string Js.t
    method unlockOrientation    : unit Js.meth
  end
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
type orientation =
  | Portrait_primary
  | Portrait_secondary
  | Landscape_primary
  | Landscape_secondary
  | Portrait
  | Landscape
  | Unknown

let portrait              = Portrait
let portrait_primary      = Portrait_primary
let portrait_secondary    = Portrait_secondary
let landscape             = Landscape
let landscape_primary     = Landscape_primary
let landscape_secondary   = Landscape_secondary

let str_to_orientation str = match str with
  | "portrait"            -> Portrait
  | "portrait-primary"    -> Portrait_primary
  | "portrait-secondary"  -> Portrait_secondary
  | "landscape"           -> Landscape
  | "landscape-primary"   -> Landscape_primary
  | "landscape-secondary" -> Landscape_secondary
  | _                     -> Unknown

let orientation_to_js_string o = match o with
  | Portrait_primary        -> Js.string "portrait-primary"
  | Portrait_secondary      -> Js.string "portrait-secondary"
  | Landscape_primary       -> Js.string "landscape-primary"
  | Landscape_secondary     -> Js.string "landscape-secondary"
  | Portrait                -> Js.string "portrait"
  | Landscape               -> Js.string "landscape"
  | _                       -> Js.string ""
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
let screen_orientation () = Js.Unsafe.js_expr ("screen")
(* --------------------------------------------------------------------------- *)
