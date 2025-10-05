// src/components/GalleryGrid.tsx
import React from "react";

// รับ children ที่จะถูกส่งเข้ามาจากข้างนอก (ในที่นี้คือ GalleryItem)
type Props = {
  children: React.ReactNode;
};

const GalleryGrid = ({ children }: Props) => {
  return (
    <div
      className="
        columns-1 gap-4 
        sm:columns-2 
        md:columns-3 
        lg:columns-4
        p-4
      "
    >
      {children}
    </div>
  );
};

export default GalleryGrid;