export type Type =
  | 'image'
  | 'audio'
  | 'pdf'
  | 'csv'
  | 'zip'
  | 'word'
  | 'excel'
  | 'outlook';

/**
 * Determines file type from name.
 * @param name
 * @returns
 */
export default function fileType(name: string): Type | null {
  const types: Record<Type, string[]> = {
    image: ['png', 'jpg', 'jpeg'],
    audio: ['mp3'],
    pdf: ['pdf'],
    csv: ['csv'],
    zip: ['zip'],
    word: ['doc', 'docx'],
    excel: ['xls', 'xlsx'],
    outlook: ['msg'],
  };

  const parts = name.split('.');
  const extension = parts[parts.length - 1];

  if (extension) {
    let type: Type;
    for (type in types) {
      const extensions = types[type];
      if (extensions.includes(extension)) {
        return type;
      }
    }
  }

  return null;
}
