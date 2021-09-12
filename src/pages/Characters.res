open Models
open Ancestor.Default

@react.component
let make = () => {
  let (loading, setLoading) = React.useState(_ => false)
  let (characterList, setCharacterList) = React.useState(_ => [])
  let (characterName, setCharacterName) = React.useState(_ => "")

  let getCharacterByName = () => {
    setLoading(_ => true)
    let params = {
      "method": "GET",
      "headers": {
        "Content-Type": "application/json",
      },
    }
    // Request.make(
    //   ~url=`${Constants.apiUrl}/people/?search=${characterName}`,
    //   ~responseType=(JsonAsAny: Request.responseType<swapiResponse<characterModel>>),
    //   (),
    // )
    Fetch.fetch("https://reqres.in/api/login", params)
    ->then(res => {
      Response.json(res)
    })
    ->then(data => {
      // Notice our pattern match on the "error" / "token" fields
      // to determine the final result. Be aware that this logic highly
      // depends on the backend specificiation.
      switch Js.Nullable.toOption(data["error"]) {
      | Some(msg) => Error(msg)
      | None =>
        switch Js.Nullable.toOption(data["token"]) {
        | Some(token) => Ok(token)
        | None => Error("Didn't return a token")
        }
      }->resolve
    })
    ->catch(e => {
      let msg = switch e {
      | JsError(err) =>
        switch Js.Exn.message(err) {
        | Some(msg) => msg
        | None => ""
        }
      | _ => "Unexpected error occurred"
      }
      Error(msg)->resolve
    })
  }

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
      disabled={loading}
      value=characterName
      onKeyPress=handleKeyPress
      onChange=handleInputChange
    />
    loadingElement
  </Box>
}
