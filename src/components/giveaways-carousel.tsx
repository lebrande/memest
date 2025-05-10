import { Carousel, CarouselContent, CarouselItem, useCarousel } from "@/components/ui/carousel";
import { Card, CardContent } from "@/components/ui/card";
import Autoplay from "embla-carousel-autoplay"

import dogeAiImage from "../assets/memes/doge-ai.png";
import pepeForkImage from "../assets/memes/pepe-fork.png";
import stonksImage from "../assets/memes/stonks.png";
import bulbImage from "../assets/memes/bulb.png";
import baseGodImage from "../assets/memes/base-god.png";
import vitaInuImage from "../assets/memes/vita-inu.png";
import { useRef } from "react";
import { Button } from "@/components/ui/button";
import { ChevronLeftIcon, ChevronRightIcon } from "lucide-react";

const giveaways = [
  { name: "DOGE AI", image: dogeAiImage },
  { name: "PEPE FORK", image: pepeForkImage },
  { name: "STONKS", image: stonksImage },
  { name: "Bulb", image: bulbImage },
  { name: "Base God", image: baseGodImage },
  { name: "Vita Inu", image: vitaInuImage },
];

export const GiveawaysCarousel = () => {
  const plugin = useRef(
    Autoplay({ delay: 2000, stopOnInteraction: true })
  )

  return (
    <Carousel
      plugins={[plugin.current]}
      opts={{
        align: "start",
        loop: true,
      }}
      onMouseEnter={plugin.current.stop}
      onMouseLeave={plugin.current.reset}
    >
      <div className="absolute -top-14 right-0 flex justify-end gap-1">
        <CarouselPrevious />
        <CarouselNext />
      </div>
      <CarouselContent className="-ml-1">
        {[...giveaways, ...giveaways].map((giveaway, index) => (
          <CarouselItem
            key={index}
            className="pl-1 basis-1/2 md:basis-1/3 lg:basis-1/5 xl:basis-1/6"
          >
            <div className="p-1">
              <Card>
                <CardContent>
                  <div className="space-y-3">
                    <Timer />
                    <img
                      src={giveaway.image.src}
                      alt={giveaway.name}
                      width={140}
                      className="rounded-full mx-auto"
                    />
                  </div>
                  <div className="space-y-2">
                    <h3 className="font-bold text-[#212b36]">{giveaway.name}</h3>
                    <div className="flex">
                      <div className="flex -space-x-2">
                        <div className="w-6 h-6 rounded-full bg-pink-300 border-2 border-white" />
                        <div className="w-6 h-6 rounded-full bg-blue-300 border-2 border-white" />
                        <div className="w-6 h-6 rounded-full bg-purple-300 border-2 border-white" />
                      </div>
                      <span className="text-sm font-bold ml-1">+999</span>
                    </div>
                    <div className="bg-brand-1 text-[#040404] text-sm font-medium py-1 px-2 rounded-md inline">$500 USDC</div>
                  </div>
                </CardContent>
              </Card>
            </div>
          </CarouselItem>
        ))}
      </CarouselContent>
    </Carousel>
  )
}

const Timer = () => {
  return (
    <div className="flex items-center justify-center gap-1">
      <div className="bg-[#212b36] text-white text-xs px-2 py-1 rounded-md">02</div>
      <span>:</span>
      <div className="bg-[#212b36] text-white text-xs px-2 py-1 rounded-md">03</div>
      <span>:</span>
      <div className="bg-[#212b36] text-white text-xs px-2 py-1 rounded-md">40</div>
    </div>
  );
}

function CarouselPrevious({
  className,
  ...props
}: React.ComponentProps<typeof Button>) {
  const { scrollPrev, canScrollPrev } = useCarousel()

  return (
    <Button
      data-slot="carousel-previous"
      variant="ghost"
      size="icon"
      className={className}
      disabled={!canScrollPrev}
      onClick={scrollPrev}
      {...props}
    >
      <ChevronLeftIcon />
      <span className="sr-only">Previous slide</span>
    </Button>
  )
}

function CarouselNext({
  className,
  ...props
}: React.ComponentProps<typeof Button>) {
  const { scrollNext, canScrollNext } = useCarousel()

  return (
    <Button
      data-slot="carousel-next"
      variant="ghost"
      size="icon"
      className={className}
      disabled={!canScrollNext}
      onClick={scrollNext}
      {...props}
    >
      <ChevronRightIcon />
      <span className="sr-only">Next slide</span>
    </Button>
  )
}
