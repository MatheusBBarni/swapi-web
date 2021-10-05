open Models
open Constants

let {useQuery, queryOptions, refetchOnWindowFocus} = module(ReactQuery)

type fetchResult =
  | Loading
  | Error
  | Empty
  | Data(array<characterModel>)

let handleFetch = (name: string): Promise.t<swapiResponse<array<characterModel>>> =>
  Fetch.fetch(`${apiUrl}/people/?search=${name}`, {"method": "GET"})->Promise.then(
    Fetch.Response.json,
  )

let useCharacterByName = (name: string) => {
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
  | {data: Some(_), isLoading: false, isError: false}
  | {data: None, isLoading: false, isError: false} =>
    Empty
  | {isLoading: true} => Loading
  | {data: Some(response), isLoading: false, isError: false} => Data(response.results)
  | _ => Error
  }
}
