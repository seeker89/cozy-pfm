BaseView = require '../lib/base_view'

module.exports = class BalanceOperationView extends BaseView

    template: require './templates/balance_operations_element'

    tagName: 'tr'

    constructor: (@model, @account) ->
        super()

    render: ->
        if @model.get("amount") > 0
            @$el.addClass "success"
        @model.account = @account
        super()
        @