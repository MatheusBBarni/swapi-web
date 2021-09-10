open Ancestor.Default

module Styles = {
  open Emotion
  let container = css({
    "font-family": "var(--font)",
    "cursor": "pointer",
  })
}

@react.component
let make = (~path: string, ~text: string, ~mr: int=0) => {
  <Typography
    mr=[xs(mr)]
    className=Styles.container
    textAlign=[xs(#center)]
    color=[xs(#hex("var(--text-color)"))]
    fontSize=[xs(#rem(1.))]
    onClick={_ => {
      RescriptReactRouter.push(path)
    }}
    tag=#a>
    {React.string(text)}
  </Typography>
}
