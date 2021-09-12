module Response = {
  type t<'data>
  @send external json: t<'data> => Promise.t<'data> = "json"
}

@val @scope("globalThis")
external fetch: (
  string,
  'params,
) => Promise.t<Response.t<{"token": Js.Nullable.t<string>, "error": Js.Nullable.t<string>}>> =
  "fetch"
