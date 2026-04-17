function fn() {
    var config = {
        baseUrl: 'https://petstore.swagger.io/v2',
        commonHeaders: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    };
    karate.configure('connectTimeout', 10000);
    karate.configure('readTimeout', 10000);
    return config;
}
