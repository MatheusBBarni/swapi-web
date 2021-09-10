open Ancestor.Default

module Text = {
  @react.component
  let make = (~color: string, ~children, ~mb=0, ~mt=0) => {
    <Typography
      className={Emotion.css({
        "font-family": "var(--font)",
        "filter": "brightness(1.2)",
      })}
      color=[xs(#hex(color))]
      fontSize=[xs(#rem(3.))]
      textAlign=[xs(#center)]
      mb=[xs(mb)]
      mt=[xs(mt)]
      tag=#p>
      children
    </Typography>
  }
}

@react.component
let make = () => {
  <Box
    mt=[xs(4)]
    mb=[xs(4)]
    display=[xs(#flex)]
    alignItems=[xs(#center)]
    justifyContent=[xs(#center)]
    width=[xs(#pct(100.))]
    flexDirection=[xs(#column)]>
    <Box
      width=[xs(#pct(50.))]
      display=[xs(#flex)]
      alignItems=[xs(#center)]
      justifyContent=[xs(#center)]
      flexWrap=[xs(#wrap)]>
      <Text color="var(--blue)" mb=5>
        {React.string("A long time ago in a galaxy far, far away...")}
      </Text>
      <Base width=[#xs(500->#px)] height=[#xs(200->#px)] src=Assets.starWarsLogo tag=#img />
      <Text color="var(--sw-yellow)" mt=5>
        {React.string("A front-end developer felt in love with the functional paradigm.")}
      </Text>
    </Box>
  </Box>
}
