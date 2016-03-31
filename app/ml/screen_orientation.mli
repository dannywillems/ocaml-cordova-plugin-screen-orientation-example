(* --------------------------------------------------------------------------- *)
type orientation_type =
  | Portrait_primary [@js "portrait-primary"]
  | Portrait_secondary [@js "portrait-secondary"]
  | Landscape_primary [@js "landscape-primary"]
  | Landscape_secondary [@js "landscape-secondary"]
  | Portrait [@js "portrait"]
  | Landscape [@js "landscape"]
  [@@js.enum]

[@@@js.stop]
val portrait                  : orientation_type
val portrait_primary          : orientation_type
val portrait_secondary        : orientation_type
val landscape                 : orientation_type
val landscape_primary         : orientation_type
val landscape_secondary       : orientation_type

val orientation_to_string     : orientation_type -> string
[@@@js.start]

[@@@js.implem
let portrait              = Portrait
let portrait_primary      = Portrait_primary
let portrait_secondary    = Portrait_secondary
let landscape             = Landscape
let landscape_primary     = Landscape_primary
let landscape_secondary   = Landscape_secondary

let orientation_to_string o = match o with
  | Portrait_primary        -> "portrait-primary"
  | Portrait_secondary      -> "portrait-secondary"
  | Landscape_primary       -> "landscape-primary"
  | Landscape_secondary     -> "landscape-secondary"
  | Portrait                -> "portrait"
  | Landscape               -> "landscape"
]
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
class screen_orientation : Ojs.t ->
  object
    inherit Ojs.obj
    method lock_orientation     : orientation_type -> unit
    method orientation          : string
    method unlock_orientation   : unit
  end
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
val t : unit -> screen_orientation
[@@js.get "screen"]
(* --------------------------------------------------------------------------- *)
