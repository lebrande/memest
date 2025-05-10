# memest

## Tech Stack

- [Astro](https://astro.build/) v5.5.5 - Modern web framework for building fast, content-focused websites
- [React](https://react.dev/) v19.0.0 - UI library for building interactive components
- [TypeScript](https://www.typescriptlang.org/) v5 - Type-safe JavaScript
- [Tailwind CSS](https://tailwindcss.com/) v4.0.17 - Utility-first CSS framework

## Prerequisites

- Node.js v22.14.0 (as specified in `.nvmrc`)
- pnpm

## Getting Started

1. Clone the repository:

```bash
git clone https://github.com/lebrande/memest.git
cd memest
```

2. Install dependencies:

```bash
pnpm install
```

3. Run the development server:

```bash
pnpm dev
```

4. Build for production:

```bash
pnpm build
```

## Available Scripts

- `pnpm dev` - Start development server
- `pnpm build` - Build for production
- `pnpm preview` - Preview production build
- `pnpm lint` - Run ESLint
- `pnpm lint:fix` - Fix ESLint issues

## Project Structure

```md
.
├── src/
│   ├── layouts/    # Astro layouts
│   ├── pages/      # Astro pages
│   │   └── api/    # API endpoints
│   ├── components/ # UI components (Astro & React)
│   └── assets/     # Static assets
├── public/         # Public assets
```

## Supabase Development

### 1. Local Development Environment

In the `supabase` directory, you'll find the local Supabase CLI development environment.
Its main purposes are:
- Creating and managing migration files
- Developing and testing Edge Functions
- Configuring and storing settings locally
- Synchronizing with Supabase cloud

### 2. Configuration and Cloud Connection

```bash
# Start local environment
supabase start

# Login to cloud project
supabase login

# Link to cloud project
supabase link

# Pull database schema from cloud
supabase db pull
```

### 3. Access to Local Tools

- **Supabase Studio**: http://127.0.0.1:54323
  - Administrative panel for database management
  - Table, permissions, and function editing

- **Edge Functions**:
  ```bash
  # Start local Edge Functions server
  supabase functions serve
  
  # Example function endpoint
  http://localhost:54321/functions/v1/hello-world
  ```

### 4. Migration Management

```bash
# Fetch migrations from database
supabase migrate fetch

# Apply migrations to database
supabase migration up

# Pull database schema (requires cloud project link)
supabase db pull
```

### 5. Stop Environment

```bash
# Stop local Supabase environment
supabase stop
```

### 6. Edge Functions - Example Implementation

```typescript
// supabase/functions/hello-world/index.ts
import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'

serve(async (req) => {
  const { name } = await req.json()
  return new Response(
    JSON.stringify({ message: `Hello ${name}!` }),
    { headers: { 'Content-Type': 'application/json' } }
  )
})
```

### 7. Testing Edge Functions

```bash
# Call function using curl
curl -i --location --request POST 'http://localhost:54321/functions/v1/hello-world' \
  --header 'Content-Type: application/json' \
  --data '{"name":"John"}'
```

### 8. Deployment

```bash
# Deploy Edge Functions to cloud
supabase functions deploy hello-world

# Deploy migrations to cloud
supabase db push
```

## AI Development Support

This project is configured with AI development tools to enhance the development experience, providing guidelines for:

- Project structure
- Coding practices
- Frontend development
- Styling with Tailwind
- Accessibility best practices
- Astro and React guidelines

### Cursor IDE

The project includes AI rules in `.cursor/rules/` directory that help Cursor IDE understand the project structure and provide better code suggestions.

### GitHub Copilot

AI instructions for GitHub Copilot are available in `.github/copilot-instructions.md`

### Windsurf

The `.windsurfrules` file contains AI configuration for Windsurf.

## Contributing

Please follow the AI guidelines and coding practices defined in the AI configuration files when contributing to this project.

## License

MIT
