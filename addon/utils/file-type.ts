export type Type = 'image' | 'pdf' | 'csv' | 'word' | 'excel' | 'outlook';

/**
 * Determines file type from extension.
 * @param extension
 * @returns
 */
export default function fileType(extension: string): Type | null {
  const types: Record<Type, string[]> = {
    image: ['png', 'jpg', 'jpeg'],
    pdf: ['pdf'],
    csv: ['csv'],
    word: ['doc', 'docx'],
    excel: ['xls', 'xlsx'],
    outlook: ['msg'],
  };

  let type: Type;
  for (type in types) {
    const extensions = types[type];
    if (extensions.includes(extension)) {
      return type;
    }
  }

  return null;
}
