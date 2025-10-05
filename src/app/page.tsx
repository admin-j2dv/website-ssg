// src/app/page.tsx
import GalleryGrid from "@/components/GalleryGrid";
import GalleryItem from "@/components/GalleryItem";

// กำหนด Type ของข้อมูลจาก picsum.photos
interface PicsumImage {
  id: string;
  author: string;
  width: number;
  height: number;
  url: string;
  download_url: string;
}

async function getGalleryData(): Promise<PicsumImage[]> {
  // เปลี่ยน URL ที่ fetch ไปยัง API ของ picsum.photos โดยตรง
  const response = await fetch(
    "https://picsum.photos/v2/list?limit=12"
  );

  if (!response.ok) {
    throw new Error("Failed to fetch gallery data from Picsum Photos");
  }

  return response.json();
}

export default async function HomePage() {
  const images = await getGalleryData();

  return (
    <main>
      <h1 className="p-8 text-center text-3xl font-bold">My Gallery</h1>
      <GalleryGrid>
        {images.map((image) => (
          <GalleryItem
            key={image.id}
            // เปลี่ยนไปใช้ field 'download_url' จากข้อมูลใหม่
            imageUrl={image.download_url}
            altText={`Photo by ${image.author}`}
          />
        ))}
      </GalleryGrid>
    </main>
  );
}