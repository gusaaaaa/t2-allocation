<div class="modal">

  <div class="modal-header">
    {{#if isNew}}
      Create Project
    {{else}}
      Editing: {{unbound name}}
    {{/if}}
    <span class="close-x" {{action close}}>&#10060;</span>
  </div>

  <form {{action save on="submit"}}>

    <div class="modal-body">
      <div class="field" {{bind-attr class="errors.name:error :field"}}>
        <label><i>&#128710;</i> Name</label>
        {{input type="text" value=name}}
        {{#each msg in errors.name}}{{msg}}{{/each}}
      </div>

      <div class="options field">
        <div class="option" {{bind-attr class="errors.provisional:error :field"}}>
          <label>{{input type="checkbox" checked=provisional}}Provisional<span></span></label>
          {{#each msg in errors.provisional}}{{msg}}{{/each}}
        </div>
      </div>

      <div class="field" {{bind-attr class="errors.notes:error :field"}}>
        <label><i>&#9998;</i> Notes</label>
        {{textarea value=notes}}
        {{#each msg in errors.notes}}{{msg}}{{/each}}
      </div>

      <div class="field">
        <div class="inline" {{bind-attr class="errors.startDate:error :field"}}>
          <label><i>&#128197;</i> Start Date</label>
          {{date-picker name="startDate" class="start-date" value=formStartDate}}
          {{#each msg in errors.startDate}}{{msg}}{{/each}}
        </div>
        <span class="inline range">&#8211;</span>
        <div class="inline" {{bind-attr class="errors.end_date:error :field"}}>
          <label>End Date</label>
          {{date-picker name="endDate" class="end-date" value=formEndDate}}
          {{#each msg in errors.endDate}}{{msg}}{{/each}}
        </div>
      </div>

      <div class="field options">
        <label><i>&#8962;</i> Offices</label>
        {{#each offices}}
          <div class="option list">
            <label {{bind-attr class="name"}}>{{input type="checkbox" checked=isSelected}}{{name}}<span></span></label>
          </div>
        {{/each}}
      </div>
    </div>

    <div class="modal-footer">
      <button class="blue-button" type="submit" {{bind-attr disabled="shouldDisableSubmit"}}>Save</button>
      <button class="white-button" {{action close}}>Cancel</button>
      {{#if isSaving}}
        Saving...
      {{/if}}
    </div>

  </form>

</div>
