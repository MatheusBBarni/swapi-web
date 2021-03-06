open Models
open Promise
open Ancestor.Default
open Render

@react.component
let make = () => {
  let (characterName, setCharacterName) = React.useState(_ => "")
  let (characters, setCharacters) = React.useState(_ => Empty)

  let fetchCharacters = name => {
    setCharacters(_ => Loading)
    Axios.get(`${Constants.apiUrl}/people/?search=${name}`)
      ->then(response => {
        let result = response.data.results
        switch result {
          | [] => setCharacters(_ => Empty)
          | _ => setCharacters(_ => Data(result))
        }
        resolve()
      })
      ->catch(_ => {
        setCharacters(_ => Error)
        resolve()
      })
      ->ignore
  }

  let handleKeyPress = event => {
    let key = ReactEvent.Keyboard.key(event)
    if key === "Enter" {
      fetchCharacters(characterName)
    }
    ()
  }

  let handleInputChange = event => {
    let value = ReactEvent.Form.currentTarget(event)["value"]

    setCharacterName(_ => value)
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
      className={Emotion.css({
        "::placeholder": {
          "fontSize": "1.2rem",
        },
      })}
      width=[#xs(500->#px)]
      height=[#xs(30->#px)]
      border=[#xs((2->#px, #solid, #hex("var(--sw-yellow)")))]
      borderRadius=[#xs(1)]
      fontSize=[xs(#rem(1.5))]
      color=[xs(#hex("var(--text-color)"))]
      bgColor=[xs(#hex("var(--bg-color)"))]
      outlineStyle=[xs(#none)]
      p=[xs(1)]
      placeholder="Type a name of SW character and press ENTER"
      tag=#input
      value=characterName
      onKeyPress=handleKeyPress
      onChange=handleInputChange
    />
    {switch characters {
    | Loading =>
      <Base
        width=[#xs(100->#px)] height=[#xs(100->#px)] mt=[xs(2)] src=Assets.loadingGif tag=#img
      />
    | Empty =>
      <Typography color=[xs(#hex("var(--sw-yellow)"))] fontSize=[xs(#rem(2.))] tag=#h1>
        {"Not found"->s}
      </Typography>
    | Error =>
      <Typography color=[xs(#hex("var(--sw-yellow)"))] fontSize=[xs(#rem(2.))] tag=#h1>
        {React.string(`Error`)}
      </Typography>
    | Data(characters) => <>
        {characters->map((character, key) => {
          <Typography key color=[xs(#hex("var(--sw-yellow)"))] fontSize=[xs(#rem(2.))] tag=#h1>
            {character.name->s}
          </Typography>
        })}
      </>
    }}
  </Box>
}
