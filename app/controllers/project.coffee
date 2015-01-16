`import Ember from "ember";`
`import { ALLOCATION_HEIGHT } from "t2-allocation/utils/constants";`
`import { group_by_sorted_name_role } from "t2-allocation/utils/group-by";`

ProjectController = Ember.ObjectController.extend
  needs: ['office']
  currentOffice: Ember.computed.alias('controllers.office.model')

  trackCount: 0

  allocations: Ember.computed.alias('model.allocations')

  selectedAllocations: (->
    allocations = @get('allocations')
    if @get('vacation')
      allocations.filterBy('person.office.id', @get('currentOffice.id'))
    else
      allocations
  ).property("currentOffice", "allocations.[]", "allocations.@each.current")

  currentAllocations: (->
    allocations = @get("selectedAllocations").filterProperty("current")

    trackNo = 0
    group_by_sorted_name_role(allocations, (allocs, person) ->
      allocs.forEach (alloc) ->
        alloc.set("track", trackNo)
      trackNo++
    )
    @set "trackCount", trackNo
    allocations
  ).property("selectedAllocations")

  projectHeight: (->
    "height: " + (@get("trackCount") * ALLOCATION_HEIGHT + 1) + "px;"
  ).property("trackCount")

  actions:
    addAllocation: (startDate) ->
      attrs =
        startDate: startDate ||= moment()
        project: @get('model')
        billable: @get('model.billable')
        provisional: @get('model.provisional')
        binding: @get('model.billable') || @get('model.vacation')
      @send 'createAllocation', attrs

`export default ProjectController;`