// Generated by CoffeeScript 1.8.0
var CozyInstance, americano;

americano = require('americano');

module.exports = CozyInstance = americano.getModel('CozyInstance', {
  domain: String,
  helpUrl: String,
  locale: String
});

CozyInstance.getInstance = function(callback) {
  return CozyInstance.request('all', function(err, instances) {
    if (err) {
      return callback(err, null);
    } else if (!((instances != null) && instances.length > 0)) {
      return callback(new Error('No instance parameters found', null));
    } else {
      return callback(null, instances[0]);
    }
  });
};
