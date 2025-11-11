/**
 * Returns early if event form does not pass validation.
 * @param _target
 * @param _propertyKey
 * @param descriptor
 */
export default function checkValidity(
  _target: unknown,
  _propertyKey: PropertyKey,
  descriptor: PropertyDescriptor,
): void {
  const method = descriptor.value as (
    ...args: [Event, ...unknown[]]
  ) => unknown;
  descriptor.value = function (...args: Parameters<typeof method>): unknown {
    const [event] = args;
    event.preventDefault();

    const { target } = event;
    if (!(target instanceof HTMLFormElement)) {
      throw new Error();
    }

    if (!target.checkValidity()) {
      target.classList.add('was-validated');
    } else {
      target.classList.remove('was-validated');
      return method.apply(this, args);
    }
  };
}
