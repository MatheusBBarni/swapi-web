%%raw("import './styles/reset.css'")

Emotion.injectGlobal(`
  :root {
    --font: 'Roboto', sans-serif;
    --sw-yellow: #FFE300;
    --black: #1c1e22;
    --text-color: #c8c8c8;
    --bg-color: #272b30;
    --blue: #005dd0;
  }
  * {
    font-family: var(--font);
  }
  body {
    background-color: var(--bg-color);
    color: var(--text-color);
  }
`)

let client = ReactQuery.Provider.createClient()

@react.component
let make = () => {
  <ReactQuery.Provider client> <Header /> <Routes /> </ReactQuery.Provider>
}
