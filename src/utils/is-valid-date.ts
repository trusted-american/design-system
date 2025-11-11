/**
 * Returns `true` if value is valid date object.
 * @param value
 * @returns
 */
export default function isValidDate(value: unknown): boolean {
  return value instanceof Date && !isNaN(value.valueOf());
}
