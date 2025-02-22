const PaginationEllipsis = <template>
  <li class="page-item">
    <div class="page-link" disabled>
      …
    </div>
  </li>
</template>;

export default PaginationEllipsis;

declare module '@glint/environment-ember-loose/registry' {
  export default interface Registry {
    'Pagination::Ellipsis': typeof PaginationEllipsis;
  }
}
