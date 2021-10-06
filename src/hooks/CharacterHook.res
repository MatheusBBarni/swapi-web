open Constants

let {useQuery, queryOptions, refetchOnWindowFocus} = module(ReactQuery)

let handleFetch = (name: string): Promise.t<Models.swapiResponse<array<Models.characterModel>>> =>
  Fetch.fetch(`${apiUrl}/people/?search=${name}`, {"method": "GET"})->Promise.then(
    Fetch.Response.json,
  )

let useCharacter = (): Models.fetchResult<array<Models.characterModel>> => {
  let (result, setResult) = React.useState(_ => Empty)

  let fetchCharacters = (name: string) => {
    let response = useQuery(
      queryOptions(
        ~queryFn=_ => handleFetch(name),
        ~queryKey="characters",
        ~refetchOnWindowFocus=refetchOnWindowFocus(#bool(false)),
        (),
      ),
    )
    setResult(_ => response)
    None
  }

  let characters = switch result {
  | {data: None, isLoading: false, isError: false} => Empty
  | {isLoading: true} => Loading
  | {data: Some(response), isLoading: false, isError: false} => Data(response.results)
  | _ => Error
  }

  {characters: characters, fetchCharacters: fetchCharacters}
}
