<header>
  <section class="nav-bar">
    {{view App.SelectOffice contentBinding="offices"
                            optionLabelPath="content.name"
                            optionValuePath="content"
                            selectionBinding="model"
                            data-test="offices"
                            class="white-button office-select"}}
    <button class="blue-button project-person-toggle"> Projects<i>&#59215;</i></button>
    {{view App.NavView}}
    <!--
    <button class="new-project-button" {{action createProject}}>Add Project</button>
    <button class="new-allocation-button" {{action createAllocation}}>Add Allocation</button>
    -->
  </section>

  <section id="calendarBar">
    <div class="calendar-date-selector">
      {{#if isEditingDate}}
        {{edit-date class="datepicker" action="confirmDate" escape-press="confirmDate"}}
      {{else}}
        <span {{action "editDate" on="click"}}>{{firstDate}}</span>
      {{/if}}
    </div>

    <ul class="calendar">
      {{#each date in dateRange}}
        <li class="week">{{date}}</li>
      {{/each}}
    </ul>
  </section>
</header>

<section id="projectList">
  {{#each project in sortedProjects}}
    {{#if project.availableProject}}
      {{ render 'availableProject' project }}
    {{else}}
      {{ render 'project' project }}
    {{/if}}
  {{/each}}
</section>
