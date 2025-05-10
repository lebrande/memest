import { cn } from "@/lib/utils";

interface Props {
  href: string;
  children: React.ReactNode;
  isActive: boolean;
}

export const NavigationLink = ({ href, children, isActive }: Props) => {
  return (
    <a
      href={href}
      className={cn("flex items-center text-sm font-medium", isActive ? "text-primary" : "text-muted-foreground")}
      aria-current={isActive ? "page" : undefined}
    >
      <span className={cn("w-2 h-2 rounded-full bg-brand-1 mr-2", isActive ? "opacity-100" : "opacity-0")} />
      {children}
    </a>
  );
};
