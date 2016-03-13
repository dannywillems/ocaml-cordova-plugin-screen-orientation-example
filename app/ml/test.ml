let doc = Dom_html.document

let new_button action =
  let row = Dom_html.createDiv doc in
  let col = Dom_html.createDiv doc in
  let button = Dom_html.createButton doc in
  row##.className := (Js.string "row");
  col##.className := (Js.string "col s12");
  button##.className := (Js.string "waves-effect waves-light btn");
  button##.innerHTML := Screenorientation.orientation_to_js_string
  action;
  Lwt.async
  ( fun () ->
    Lwt_js_events.clicks button
    ( fun _ev _thread ->
      let screen = Screenorientation.screen_orientation () in
      screen##(lockOrientation (Screenorientation.orientation_to_js_string
      action));
      Lwt.return ()
    )
  );
  Dom.appendChild col button;
  Dom.appendChild row col;
  row

let on_device_ready _ =
  let div = Dom_html.createDiv doc in
  div##.className := (Js.string "container center");
  Dom.appendChild div (new_button Screenorientation.portrait);
  Dom.appendChild div (new_button Screenorientation.portrait_primary);
  Dom.appendChild div (new_button Screenorientation.portrait_secondary);
  Dom.appendChild div (new_button Screenorientation.landscape);
  Dom.appendChild div (new_button Screenorientation.landscape_primary);
  Dom.appendChild div (new_button Screenorientation.landscape_secondary);
  Dom.appendChild doc##.body div;
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
(Dom_html.handler on_device_ready) Js._false
