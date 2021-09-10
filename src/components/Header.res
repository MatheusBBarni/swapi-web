open Ancestor.Default

module Styles = {
  open Emotion
  let container = css({
    "font-family": "var(--font)",
  })
}

@react.component
let make = () => {
  <Box
    bgColor=[xs(#hex("var(--black)"))]
    p=[xs(3)]
    display=[xs(#flex)]
    alignItems=[xs(#center)]
    className=Styles.container>
    <Typography color=[xs(#hex("var(--sw-yellow)"))] fontSize=[xs(#rem(2.))] tag=#h1>
      {React.string(`SWAPI`)}
    </Typography>
    <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")] width=[xs(#pct(100.))]>
      <Typography
        textAlign=[xs(#center), lg(#left)]
        color=[xs(#hex("var(--text-color)"))]
        tag=#a
        href=`/characters`>
        {React.string(`Characters`)}
      </Typography>
    </Box>
  </Box>
}
