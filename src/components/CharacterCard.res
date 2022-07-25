open Ancestor.Default
open Models

@react.component
let make = (~character: characterModel) => {
  let { name, url } = character

  let characterId = React.useMemo1(_ => {
    let resultId = url->Js.String.split("/")->Js.Array.filter(c => c !== "")->Js.Array.pop

    switch resultId {
    | Some(id) => id
    | None => ""
    }
  }, [url])

  <Box mt=[xs(2)] onClick={_ => RescriptReactRouter.push(`/character/${characterId}`)} cursor=[xs(#pointer)]>
    <Typography fontSize=[xs(20->#px)] fontFamily=[xs(["var(--font)"]->#custom)]>
      {name->React.string}
    </Typography>
  </Box>
}

let make = React.memo(make)