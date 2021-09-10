open Ancestor.Default

@react.component
let make = () => {
  <Box
    mt=[xs(4)]
    display=[xs(#flex)]
    alignItems=[xs(#center)]
    justifyContent=[xs(#center)]
    className={Emotion.css({
      "font-family": "var(--font)",
    })}>
    <Base width=[#xs(300->#px)] height=[#xs(100->#px)] src=Assets.starWarsLogo tag=#img />
  </Box>
}
