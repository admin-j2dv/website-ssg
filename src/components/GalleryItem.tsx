// src/components/GalleryItem.tsx
import Image from "next/image";

type Props = {
  imageUrl: string;
  altText: string;
};

const GalleryItem = ({ imageUrl, altText }: Props) => {
  return (
    <div className="mb-4 break-inside-avoid">
      <Image
        src={imageUrl}
        alt={altText}
        width={500}
        height={500}
        className="h-auto w-full rounded-lg bg-gray-200"
      />
    </div>
  );
};

export default GalleryItem;