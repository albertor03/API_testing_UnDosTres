function fn() {
  if (!env) {
    env = 'dev';
  }
  var config = {
    baseUrl: "https://reqres.in",
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}