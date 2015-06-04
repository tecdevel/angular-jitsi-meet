'use strict'

#global objects: APP, config

module.exports = ($log, $rootScope) ->
  XMPP = require 'jitsi-meet/modules/xmpp/xmpp'

  XMPPEvents = require 'jitsi-meet/service/xmpp/XMPPEvents'
  for eventType, eventName of XMPPEvents
    XMPP.addListener eventName, (args...) ->
      $rootScope.$broadcast eventName, args...
      $log.info "Listening for #{eventName} events"
  XMPP
