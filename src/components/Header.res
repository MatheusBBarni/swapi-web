open Ancestor.Default

@react.component
let make = () => {
  <Box
    bgColor=[xs(#hex("var(--black)"))]
    p=[xs(2)]
    display=[xs(#flex)]
    alignItems=[xs(#center)]
    className={Emotion.css({
      "font-family": "var(--font)",
    })}>
    <Typography color=[xs(#hex("var(--sw-yellow)"))] fontSize=[xs(#rem(2.))] tag=#h1>
      {React.string(`SWAPI`)}
    </Typography>
    <Box display=[xs(#flex)] justifyContent=[xs(#"flex-end")] width=[xs(#pct(100.))]>
      <Link text=`Home` path=`/` mr=2 /> <Link text=`Characters` path=`/characters` />
    </Box>
  </Box>
}
