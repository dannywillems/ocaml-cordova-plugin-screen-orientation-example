(* --------------------------------------------------------------------------- *)
class type screen_orientation =
  object
    method lockOrientation      : Js.js_string Js.t -> unit Js.meth
    method orientation          : Js.js_string Js.t
    method unlockOrientation    : unit Js.meth
  end
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
type orientation

val portrait                  : orientation
val portrait_primary          : orientation
val portrait_secondary        : orientation
val landscape                 : orientation
val landscape_primary         : orientation
val landscape_secondary       : orientation

val str_to_orientation        : string -> orientation

val orientation_to_js_string  : orientation -> Js.js_string Js.t
(* --------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------- *)
val screen_orientation        : unit -> screen_orientation Js.t
(* --------------------------------------------------------------------------- *)
