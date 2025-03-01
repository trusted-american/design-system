import RouteTemplate from 'ember-route-template';
import { Button, MainBody } from '@trusted-american/design-system';
import { breadcrumb } from 'ember-breadcrumb-trail';
import { pageTitle } from 'ember-page-title';

import type { TemplateFactory } from 'global';

export default RouteTemplate(
  <template>
    {{pageTitle "Home"}}
    {{breadcrumb "Home" route="index"}}

    <MainBody>
      <div class="p-5 mb-4 bg-body-tertiary rounded-3">
        <div class="container-fluid py-5">
          <h1 class="display-5 fw-bold">Design System</h1>
          <p class="col-md-8 fs-4">Components for building robust user
            interfaces.</p>
          <Button
            @label="Get started"
            @color="primary"
            @size="lg"
            @route="guides.introduction"
          />
        </div>
      </div>

      <div class="row g-4 py-5 row-cols-1 row-cols-lg-3">
        <div class="col d-flex align-items-start">
          <div
            class="icon-square text-bg-light d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3"
          >
            <svg class="bi" width="1em" height="1em"><use
                xlink:href="#toggles2"
              ></use></svg>
          </div>
          <div>
            <h3 class="fs-2">Flexible</h3>
            <p>Paragraph of text beneath the heading to explain the heading.
              We'll add onto it with another sentence and probably just keep
              going until we run out of words.</p>
            <Button @label="Explore" @color="primary" @route="components" />
          </div>
        </div>
        <div class="col d-flex align-items-start">
          <div
            class="icon-square text-bg-light d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3"
          >
            <svg class="bi" width="1em" height="1em"><use
                xlink:href="#cpu-fill"
              ></use></svg>
          </div>
          <div>
            <h3 class="fs-2">Lightweight</h3>
            <p>Paragraph of text beneath the heading to explain the heading.
              We'll add onto it with another sentence and probably just keep
              going until we run out of words.</p>
            <Button @label="Explore" @color="primary" @route="components" />
          </div>
        </div>
        <div class="col d-flex align-items-start">
          <div
            class="icon-square text-bg-light d-inline-flex align-items-center justify-content-center fs-4 flex-shrink-0 me-3"
          >
            <svg class="bi" width="1em" height="1em"><use
                xlink:href="#tools"
              ></use></svg>
          </div>
          <div>
            <h3 class="fs-2">Effortless</h3>
            <p>Paragraph of text beneath the heading to explain the heading.
              We'll add onto it with another sentence and probably just keep
              going until we run out of words.</p>
            <Button @label="Explore" @color="primary" @route="components" />
          </div>
        </div>
      </div>
    </MainBody>
  </template>,
) as TemplateFactory;
