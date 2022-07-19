type characterModel = {
  name: string,
  height: string,
  mass: string,
  hair_color: string,
  skin_color: string,
  eye_color: string,
  birth_year: string,
  gender: string,
  homeworld: string,
  films: array<string>,
  species: array<string>,
  vehicles: array<string>,
  starships: array<string>,
  created: string,
  edited: string,
  url: string,
}

type swapiResponse<'a> = {
  ok: bool,
  count: int,
  next: string,
  previous: string,
  results: 'a,
}

type axiosResponse<'a> = {
  status: int,
  statusText: string,
  data: swapiResponse<'a>,
}

type characters = Empty | Loading | Error | Data(array<characterModel>)
