BaseView = require '../lib/base_view'

module.exports = class BalanceOperationView extends BaseView

    template: require './templates/balance_operations_element'

    tagName: 'tr'

    constructor: (@model, @account, @showAccountNum = false) ->
        super()

    fakeFeatureLink: ->
        if @model.get('title') is "SNCF" and @model.get('amount') is -137.00
            return 'pdf/factureSNCF.pdf'
        else if @model.get('title') is "SFR Facture"
            return 'pdf/factureSFR.pdf'
        else return null

    render: ->
        if @model.get("amount") > 0
            @$el.addClass "success"
        @model.account = @account
        @model.formattedDate = moment(@model.get('date')).format "DD/MM/YYYY"
        formattedAmount = @fakeFeatureLink()
        @model.formattedAmount = formattedAmount unless formattedAmount is null

        if @showAccountNum
            hint = "#{@model.account.get('title')}, " + \
                   "n°#{@model.account.get('accountNumber')}"
            @model.hint = "#{@model.account.get('title')}, " + \
                          "n°#{@model.account.get('accountNumber')}"
        else
            @model.hint = "#{@model.get('raw')}"
        super()
        @