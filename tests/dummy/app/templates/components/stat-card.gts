import RouteTemplate from 'ember-route-template';
import Snippet from '../../components/snippet';
import { Heading, StatCard } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';
import { faUser } from '@fortawesome/free-solid-svg-icons';

export default RouteTemplate(
  <template>
    {{pageTitle "Stat card"}}
    {{breadcrumb "Stat card" route="components.stat-card"}}

    <Heading @title="Stat card" />

    <Snippet @name="stat-card.gts">
      {{! BEGIN-SNIPPET stat-card }}
      <div class="row">
        <div class="col">
          <StatCard @label="Key 1" @value="0" />
        </div>
        <div class="col">
          <StatCard @label="Key 2" @value="12" />
        </div>
        <div class="col">
          <StatCard @label="Key 3" @value="123" />
        </div>
        <div class="col">
          <StatCard
            @label="Key 4"
            @value="1,234"
            @icon={{faUser}}
            @route="index"
          />
        </div>
        <div class="col">
          <StatCard @label="Key 5" @icon={{faUser}} @route="index">
            Block
          </StatCard>
        </div>
      </div>
      {{! END-SNIPPET }}
    </Snippet>
  </template>,
);
