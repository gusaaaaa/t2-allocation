{{#unless vacation}}
  {{#each conflict in conflicts}}
    {{render "conflict" conflict}}
  {{/each}}
{{/unless}}
<div class="allocation-content" {{bind-attr title="hint"}}>
  {{#if person}}
    <span class="allocation-identifier">{{ person.name }}</span>
  {{/if}}

  {{#if isExternal}}
    <em>({{office.name}})</em>
  {{/if}}

  {{#if isPartial}}
    <span>@{{percentAllocated}}%</span>
  {{/if}}
  <span class="allocation-range">{{ shortDate startDate }} - {{ shortDate endDate }}</span>
</div>

