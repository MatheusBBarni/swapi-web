open Constants

let {useQuery, queryOptions, refetchOnWindowFocus} = module(ReactQuery)

let handleFetch = (name: string): Promise.t<Models.swapiResponse<array<Models.characterModel>>> =>
  Fetch.fetch(`${apiUrl}/people/?search=${name}`, {"method": "GET"})->Promise.then(
    Fetch.Response.json,
  )

let useCharacterByName = (name: string): Models.fetchResult<array<Models.characterModel>> => {
  let result = useQuery(
    queryOptions(
      //
      ~queryFn=_ => handleFetch(name),
      ~queryKey="characters",
      ~refetchOnWindowFocus=refetchOnWindowFocus(#bool(false)),
      (),
    ),
  )

  switch result {
  | {data: None, isLoading: false, isError: false} => Empty
  | {isLoading: true} => Loading
  | {data: Some(response), isLoading: false, isError: false} => Data(response.results)
  | _ => Error
  }
}
