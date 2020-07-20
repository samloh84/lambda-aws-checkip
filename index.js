const _ = require('lodash');
const Promise = require('bluebird');
const request_ip = require('request-ip');


function handler(event, context) {
    try {

        console.log("Event: " + JSON.stringify(event, null, 4));


        let body = _.get(event, 'body');
        if (!_.isNil(body)) {
            body = JSON.parse(body);
            console.log("Body: " + JSON.stringify(body, null, 4));

        }


        let client_ip = request_ip.getClientIp(event);

        return Promise.resolve({
            statusCode: 200,
            body: JSON.stringify({
                ip: client_ip
            })
        });
    } catch (err) {
        return Promise.reject(err);
    }

}

module.exports = {handler: handler};