var exec = require('cordova/exec');

exports.startServer = function(port, bonjourName, success, error) {
    exec(success, error, 'BonjourServer', 'startServer', [port, bonjourName]);
};

exports.stopServer = function(success, error) {
    exec(success, error, 'BonjourServer', 'stopServer', []);
};

exports.setRequestHandler = function(handler, success, error) {
    exec(success, error, 'BonjourServer', 'setRequestHandler', [handler]);
};

exports.setResponseString = function(response, success, error) {
    exec(success, error, 'BonjourServer', 'setResponseString', [response]);
};

exports.sendResponse = function(response, success, error) {
    exec(success, error, 'BonjourServer', 'sendResponse', [response]);
};


exports.echojs = function (arg0, success, error) {
    if (arg0 && typeof (arg0) === 'string' && arg0.length > 0) {
        success(arg0);
    } else {
        error('Empty message!');
    }
};