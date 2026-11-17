# Run on Windows to regenerate the checked-in Open Graph and X share images.
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$assets = Join-Path $PSScriptRoot '../dist/assets'
$canvas = [Drawing.Bitmap]::new(1200, 630, [Drawing.Imaging.PixelFormat]::Format24bppRgb)
$graphics = [Drawing.Graphics]::FromImage($canvas)
$portrait = [Drawing.Image]::FromFile((Join-Path $assets 'jon-portrait.png'))
$gradient = [Drawing.Drawing2D.LinearGradientBrush]::new(
    [Drawing.Rectangle]::new(0, 0, $canvas.Width, $canvas.Height),
    [Drawing.ColorTranslator]::FromHtml('#0B1020'),
    [Drawing.ColorTranslator]::FromHtml('#26254D'),
    [single]12
)
$white = [Drawing.SolidBrush]::new([Drawing.ColorTranslator]::FromHtml('#F5F7FC'))
$muted = [Drawing.SolidBrush]::new([Drawing.ColorTranslator]::FromHtml('#BBBCE1'))
$accent = [Drawing.SolidBrush]::new([Drawing.ColorTranslator]::FromHtml('#FFC4AD'))
$border = [Drawing.Pen]::new([Drawing.Color]::FromArgb(110, 222, 212, 244), 1)
$hairline = [Drawing.Pen]::new([Drawing.Color]::FromArgb(76, 219, 212, 244), 1)
$orbitLine = [Drawing.Pen]::new([Drawing.Color]::FromArgb(44, 237, 211, 244), 1)
$arrow = [Drawing.Pen]::new($accent, 1.5)
$markFont = [Drawing.Font]::new('Georgia', 40, [Drawing.FontStyle]::Italic, [Drawing.GraphicsUnit]::Pixel)
$labelFont = [Drawing.Font]::new('Consolas', 19, [Drawing.FontStyle]::Regular, [Drawing.GraphicsUnit]::Pixel)
$nameFont = [Drawing.Font]::new('Georgia', 102, [Drawing.FontStyle]::Regular, [Drawing.GraphicsUnit]::Pixel)
$roleFont = [Drawing.Font]::new('Segoe UI', 36, [Drawing.FontStyle]::Regular, [Drawing.GraphicsUnit]::Pixel)
$taglineFont = [Drawing.Font]::new('Segoe UI', 25, [Drawing.FontStyle]::Regular, [Drawing.GraphicsUnit]::Pixel)
$domainFont = [Drawing.Font]::new('Consolas', 24, [Drawing.FontStyle]::Regular, [Drawing.GraphicsUnit]::Pixel)
$format = [Drawing.StringFormat]::GenericTypographic
$frame = [Drawing.Drawing2D.GraphicsPath]::new()
$encoderParams = [Drawing.Imaging.EncoderParameters]::new(1)
$encoderParams.Param[0] = [Drawing.Imaging.EncoderParameter]::new([Drawing.Imaging.Encoder]::Quality, [long]92)

function Add-SkyGlow {
    param([Drawing.Rectangle]$Bounds, [string]$Color, [int]$Opacity)

    $shape = [Drawing.Drawing2D.GraphicsPath]::new()
    $shape.AddEllipse($Bounds)
    $glow = [Drawing.Drawing2D.PathGradientBrush]::new($shape)
    try {
        $tint = [Drawing.ColorTranslator]::FromHtml($Color)
        $glow.CenterColor = [Drawing.Color]::FromArgb($Opacity, $tint)
        $glow.SurroundColors = [Drawing.Color[]]@([Drawing.Color]::FromArgb(0, $tint))
        $glow.SetBlendTriangularShape(1, 1)
        $graphics.FillPath($glow, $shape)
    } finally {
        $glow.Dispose()
        $shape.Dispose()
    }
}

try {
    $graphics.SmoothingMode = [Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.InterpolationMode = [Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.PixelOffsetMode = [Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $graphics.TextRenderingHint = [Drawing.Text.TextRenderingHint]::AntiAliasGridFit
    $graphics.FillRectangle($gradient, 0, 0, $canvas.Width, $canvas.Height)
    # Align the layout with the center of both crops.
    $graphics.TranslateTransform(0, 15)

    # Echo the site's time-of-day control with overlapping sunset colors.
    Add-SkyGlow ([Drawing.Rectangle]::new(450, -360, 1130, 1100)) '#5966AE' 232
    Add-SkyGlow ([Drawing.Rectangle]::new(537, 124, 1180, 830)) '#E78384' 218
    Add-SkyGlow ([Drawing.Rectangle]::new(860, 315, 680, 515)) '#FFD5AD' 160
    $graphics.DrawEllipse($orbitLine, 687, -110, 677, 770)
    $graphics.DrawEllipse($orbitLine, 721, -78, 610, 704)

    # Frame the unchanged source photo, centering the crop on Jon's face.
    $photo = [Drawing.Rectangle]::new(772, 75, 340, 450)
    $diameter = 26
    $frame.AddArc($photo.Left, $photo.Top, $diameter, $diameter, 180, 90)
    $frame.AddArc($photo.Right - $diameter, $photo.Top, $diameter, $diameter, 270, 90)
    $frame.AddArc($photo.Right - $diameter, $photo.Bottom - $diameter, $diameter, $diameter, 0, 90)
    $frame.AddArc($photo.Left, $photo.Bottom - $diameter, $diameter, $diameter, 90, 90)
    $frame.CloseFigure()
    $cropWidth = [int][Math]::Round([Math]::Min($portrait.Width * 0.78, $portrait.Height * $photo.Width / $photo.Height))
    $cropHeight = [int][Math]::Round($cropWidth * $photo.Height / $photo.Width)
    $cropLeft = [int][Math]::Floor(($portrait.Width - $cropWidth) / 2)
    $cropTop = [int][Math]::Floor(($portrait.Height - $cropHeight) * 0.3)
    $graphics.SetClip($frame)
    $graphics.DrawImage($portrait, $photo, $cropLeft, $cropTop, $cropWidth, $cropHeight, [Drawing.GraphicsUnit]::Pixel)
    $graphics.ResetClip()
    $graphics.DrawPath($border, $frame)
    $graphics.DrawLine($hairline, 1127, 92, 1127, 505)
    $graphics.DrawLine($hairline, 789, 540, 1095, 540)

    $graphics.DrawString('JZ', $markFont, $white, 78, 69, $format)
    $markWidth = $graphics.MeasureString('JZ', $markFont, [Drawing.PointF]::Empty, $format).Width
    $graphics.DrawString('.', $markFont, $accent, 78 + $markWidth, 69, $format)
    $graphics.DrawString('ENGINEERING PORTFOLIO', $labelFont, $muted, 164, 88, $format)
    $graphics.DrawLine($hairline, 80, 132, 638, 132)

    $graphics.DrawString('Jon Zhang', $nameFont, $white, 75, 189, $format)
    $nameWidth = $graphics.MeasureString('Jon Zhang', $nameFont, [Drawing.PointF]::Empty, $format).Width
    $graphics.DrawString('.', $nameFont, $accent, 75 + $nameWidth, 189, $format)
    $graphics.DrawString('GenAI / Full-Stack Engineer', $roleFont, $white, 80, 310, $format)
    $graphics.DrawString('From system design to production.', $taglineFont, $muted, 81, 368, $format)

    $graphics.DrawLine($hairline, 80, 462, 638, 462)
    $graphics.DrawString('jonzhang.dev', $domainFont, $accent, 80, 485, $format)
    $graphics.DrawLine($arrow, 267, 501, 279, 489)
    $graphics.DrawLine($arrow, 271, 489, 279, 489)
    $graphics.DrawLine($arrow, 279, 489, 279, 497)

    $jpeg = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object MimeType -eq 'image/jpeg'
    $canvas.Save((Join-Path $assets 'social-preview.jpg'), $jpeg, $encoderParams)
    $xCard = $canvas.Clone([Drawing.Rectangle]::new(0, 15, 1200, 600), $canvas.PixelFormat)
    try {
        $xCard.Save((Join-Path $assets 'social-preview-x.jpg'), $jpeg, $encoderParams)
    } finally {
        $xCard.Dispose()
    }
} finally {
    $encoderParams.Dispose()
    $frame.Dispose()
    $format.Dispose()
    $domainFont.Dispose()
    $taglineFont.Dispose()
    $roleFont.Dispose()
    $nameFont.Dispose()
    $labelFont.Dispose()
    $markFont.Dispose()
    $arrow.Dispose()
    $orbitLine.Dispose()
    $hairline.Dispose()
    $border.Dispose()
    $accent.Dispose()
    $muted.Dispose()
    $white.Dispose()
    $gradient.Dispose()
    $portrait.Dispose()
    $graphics.Dispose()
    $canvas.Dispose()
}
