open Constants

type fetchResult =
  | Loading
  | Error
  | Empty
  | Data(array<Models.characterModel>)

type hookResult = {
  characters: fetchResult,
  fetchCharacters: string => unit,
}

let {useQuery, queryOptions, refetchOnWindowFocus} = module(ReactQuery)

let handleFetch = (name: string): Promise.t<Models.swapiResponse<array<Models.characterModel>>> =>
  Fetch.fetch(`${apiUrl}/people/?search=${name}`, {"method": "GET"})->Promise.then(
    Fetch.Response.json,
  )

let useCharacter = (): hookResult => {
  let (result, setResult) = React.useState(_ => Empty)

  let fetchCharacters = name => {
    let response = useQuery(
      queryOptions(
        ~queryFn=_ => handleFetch(name),
        ~queryKey="characters",
        ~refetchOnWindowFocus=refetchOnWindowFocus(#bool(false)),
        (),
      ),
    )
    setResult(_ =>
      switch response {
      | {data: None, isLoading: false, isError: false} => Empty
      | {isLoading: true} => Loading
      | {data: Some(response), isLoading: false, isError: false} => Data(response.results)
      | _ => Error
      }
    )
  }

  /* let characters = switch result {
  | Data(charactersResponse) => Data(charactersResponse)
  | Loading => Loading
  | Empty => Empty
  | _ => Error
  }*/

  {characters: result, fetchCharacters: fetchCharacters}
}
