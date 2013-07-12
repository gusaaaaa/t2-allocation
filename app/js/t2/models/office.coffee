attr = Ember.attr
belongsTo = Ember.belongsTo
hasMany = Ember.hasMany
App.Office = Ember.Model.extend(
  name: attr()
  notes: attr()
  projects: hasMany("App.Project",
    key: "project_ids"
  )
  people: hasMany("App.Person",
    key: "person_ids"
  )
)
App.Office.collectionKey = "offices"
App.Office.camelizeKeys = true
