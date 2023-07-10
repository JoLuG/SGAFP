import cgi
import openai

# Configurar tu clave de API de OpenAI
openai.api_key = "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"

# Obtener los datos del formulario enviado desde el JSP
form = cgi.FieldStorage()
usuario = form.getvalue("Wendy167")

# Obtener los datos de ingresos y gastos del usuario desde la base de datos
# (Asegúrate de reemplazar las consultas SQL y la conexión a la base de datos con tu propia implementación)
ingresos = obtener_ingresos_desde_bd(usuario)
gastos = obtener_gastos_desde_bd(usuario)

# Crear el mensaje de entrada para el modelo GPT-3
mensaje = f"La siguiente es una conversación con el asistente de IA \"SGFP\" experto en Finanzas Personales...\n\nHumano: hola, quien eres?\nAI: Soy una IA creada por OpenAI. ¿Cómo puedo ayudarte hoy?\nHumano: Tengo los ingresos y gastos:\n\n{ingresos}\n\n{gastos}, no menciones el total, solo consejos por cada descripción, con los datos reales\n"

# Generar los consejos utilizando OpenAI
respuesta = openai.Completion.create(
  model="text-davinci-003",
  prompt=mensaje,
  temperature=0.69,
  max_tokens=287,
  top_p=1,
  frequency_penalty=0,
  presence_penalty=0.6,
  stop=[" Human:", " AI:"]
)

# Obtener el texto generado por el modelo GPT-3
consejos = respuesta["choices"][0]["text"]

# Imprimir los consejos en el formato que desees
print("Content-type: text/html\n")
print(f"<h1>Consejos para {usuario}</h1>")
print("<p>" + consejos + "</p>")
