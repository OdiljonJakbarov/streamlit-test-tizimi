# Test Tizimi — Streamlit + Supabase

## Ishga tushirish tartibi

### 1. Supabase jadvallar yaratish
`create_tables.sql` faylini Supabase **SQL Editor** da ishga tushiring:
- supabase.com → loyiha → **SQL Editor** → `create_tables.sql` mazmunini paste qiling → **Run**

### 2. GitHub ga yuklash
Bu papkadagi barcha fayllarni yangi GitHub repoga yuklang.
⚠️ `.streamlit/secrets.toml` faylini yuklamang (gitignore da bor)

### 3. Streamlit Cloud da deploy
- streamlit.io/cloud → **New app** → GitHub reponni tanlang
- **Secrets** bo'limiga quyidagini kiriting:
```toml
SUPABASE_URL = "https://lcfudylotwvlqnfphctt.supabase.co"
SUPABASE_KEY = "eyJhbGci..."
```

### Sahifalar
| Sahifa | URL |
|---|---|
| Talaba (bosh sahifa) | `/` |
| O'qituvchi kirish | Bosh sahifada tugma |
| Administrator | Yuqori o'ng burchak |

### Administrator paroli
Birinchi kirish: `admin123`
Kirgandan keyin **Parol** tabida o'zgartiring.
