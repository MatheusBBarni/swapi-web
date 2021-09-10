%%raw("import './styles/reset.css'")

Emotion.injectGlobal(`
  :root {
    --font: 'Roboto', sans-serif;
    --sw-yellow: #FFE300;
    --black: #272b30;
    --text-color: #c8c8c8;
  }
  * {
    font-family: var(--font);
  }
`)

@react.component
let make = () => {
  <> <Header /> <Routes /> </>
}
