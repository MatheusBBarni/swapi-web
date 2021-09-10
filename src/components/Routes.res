@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{} => <Home />
  | list{"characters"} => <Characters />
  | _ => <NotFound />
  }
}
