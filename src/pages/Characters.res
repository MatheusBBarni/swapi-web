open Ancestor.Default

@react.component
let make = () => {
  let (characterName, setCharacterName) = React.useState(_ => "")
  let (loading, setLoading) = React.useState(_ => false)

  let handleInputChange = event => {
    let value = ReactEvent.Form.currentTarget(event)["value"]

    setCharacterName(_ => value)
  }

  let handleKeyPress = event => {
    let key = ReactEvent.Keyboard.key(event)
    if key === "Enter" {
      getCharacterByName()
    }
  }

  let loadingElement = if loading {
    <Base width=[#xs(100->#px)] height=[#xs(100->#px)] mt=[xs(2)] src=Assets.loadingGif tag=#img />
  } else {
    <> </>
  }

  <Box
    mt=[xs(4)]
    mb=[xs(4)]
    display=[xs(#flex)]
    alignItems=[xs(#center)]
    justifyContent=[xs(#center)]
    width=[xs(#pct(100.))]
    flexDirection=[xs(#column)]>
    <Base
      width=[#xs(500->#px)]
      height=[#xs(30->#px)]
      border=[#xs((2->#px, #solid, #hex("var(--sw-yellow)")))]
      borderRadius=[#xs(1)]
      fontSize=[xs(#rem(1.5))]
      color=[xs(#hex("var(--text-color)"))]
      bgColor=[xs(#hex("var(--bg-color)"))]
      outlineStyle=[xs(#none)]
      p=[xs(1)]
      placeholder="Type a name of SW character"
      tag=#input
      value=characterName
      onKeyPress=handleKeyPress
      onChange=handleInputChange
    />
  </Box>
}
