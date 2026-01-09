//# Crear src/pages/UploadFlow/UploadFlow.tsx
import React from "react"
import { useNavigate } from "react-router-dom"
import {
  Box,
  Typography,
  Button,
  Container,
  Alert,
  Paper,
} from "@mui/material"
import { ArrowBack } from "@mui/icons-material"

const UploadFlow: React.FC = () => {
  const navigate = useNavigate()

  return (
    <Container maxWidth="lg">
      <Button
        startIcon={<ArrowBack />}
        onClick={() => navigate("/")}
        sx={{ mb: 3 }}
      >
        Volver al inicio
      </Button>
      
      <Paper sx={{ p: 4, textAlign: "center" }}>
        <Typography variant="h4" component="h1" gutterBottom>
          Carga de Documentos SAT
        </Typography>
        
        <Alert severity="info" sx={{ mb: 3, textAlign: "left" }}>
          Esta sección está en desarrollo. Pronto podrás cargar tu RTU, libros de compras y ventas.
        </Alert>
        
        <Typography variant="body1" color="text.secondary" paragraph>
          En esta sección guiaremos paso a paso la carga de todos los documentos necesarios
          para generar tu libro de compras y ventas según los requerimientos de la SAT Guatemala.
        </Typography>
        
        <Box sx={{ mt: 4 }}>
          <Typography variant="h6" gutterBottom>
            Documentos requeridos:
          </Typography>
          <Typography variant="body2" color="text.secondary">
            1. Registro Tributario Unificado (RTU)<br />
            2. Libro de Compras del período<br />
            3. Libro de Ventas del período<br />
            4. Comprobantes Fiscales Autorizados (opcional)<br />
            5. Documentos de retención (si aplica)
          </Typography>
        </Box>
      </Paper>
    </Container>
  )
}

export default UploadFlow
//'@ | Set-Content -Path "src\pages\UploadFlow\UploadFlow.tsx" -Encoding UTF8