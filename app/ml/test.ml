let doc = Dom_html.document

let new_button action =
  let row = Dom_html.createDiv doc in
  let col = Dom_html.createDiv doc in
  let button = Dom_html.createButton doc in
  row##.className := (Js.string "row");
  col##.className := (Js.string "col s12");
  button##.className := (Js.string "waves-effect waves-light btn");
  button##.innerHTML := (Js.string (Screen_orientation.orientation_to_string
  action));
  Lwt.async
  ( fun () ->
    Lwt_js_events.clicks button
    ( fun _ev _thread ->
      let screen = Screen_orientation.t () in
      screen#lock_orientation action;
      Lwt.return ()
    )
  );
  Dom.appendChild col button;
  Dom.appendChild row col;
  row

let on_device_ready _ =
  let div = Dom_html.createDiv doc in
  div##.className := (Js.string "container center");
  Dom.appendChild div (new_button Screen_orientation.portrait);
  Dom.appendChild div (new_button Screen_orientation.portrait_primary);
  Dom.appendChild div (new_button Screen_orientation.portrait_secondary);
  Dom.appendChild div (new_button Screen_orientation.landscape);
  Dom.appendChild div (new_button Screen_orientation.landscape_primary);
  Dom.appendChild div (new_button Screen_orientation.landscape_secondary);
  Dom.appendChild doc##.body div;
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
(Dom_html.handler on_device_ready) Js._false
